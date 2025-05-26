from fastapi import FastAPI, HTTPException, Query
from fastapi.responses import FileResponse
import yt_dlp
import os
import uuid

app = FastAPI()

# Directory to store downloaded MP3s
DOWNLOAD_DIR = "downloads"
os.makedirs(DOWNLOAD_DIR, exist_ok=True)

@app.get("/download-mp3")
def download_mp3(url: str = Query(..., description="YouTube video URL")):
    video_id = str(uuid.uuid4())
    output_path = os.path.join(DOWNLOAD_DIR, f"{video_id}.%(ext)s")

    ydl_opts = {
        'format': 'bestaudio/best',
        'outtmpl': output_path,
        'postprocessors': [{
            'key': 'FFmpegExtractAudio',
            'preferredcodec': 'mp3',
            'preferredquality': '192',
        }],
        'quiet': True,
    }

    try:
        with yt_dlp.YoutubeDL(ydl_opts) as ydl:
            ydl.download([url])
    except Exception as e:
        raise HTTPException(status_code=400, detail=f"Download failed: {e}")

    mp3_file = os.path.join(DOWNLOAD_DIR, f"{video_id}.mp3")

    if not os.path.exists(mp3_file):
        raise HTTPException(status_code=500, detail="Failed to convert video to MP3.")

    return FileResponse(mp3_file, media_type="audio/mpeg", filename=f"{video_id}.mp3")
