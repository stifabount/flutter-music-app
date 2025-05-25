import os
from flask import after_this_request

@app.route('/api/download', methods=['GET'])
def download_audio():
    url = request.args.get('url')
    if not url:
        return {'error': 'URL parameter is required'}, 400

    unique_id = str(uuid.uuid4())
    output_path = f"{DOWNLOAD_FOLDER}/{unique_id}.%(ext)s"

    ydl_opts = {
        'format': 'bestaudio/best',
        'outtmpl': output_path,
        'postprocessors': [{
            'key': 'FFmpegExtractAudio',
            'preferredcodec': 'mp3',
            'preferredquality': '192',
        }],
        'quiet': True
    }

    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        ydl.download([url])

    final_path = f"{DOWNLOAD_FOLDER}/{unique_id}.mp3"

    @after_this_request
    def cleanup(response):
        try:
            os.remove(final_path)
        except Exception as e:
            print(f"Error removing file: {e}")
        return response

    return send_file(final_path, as_attachment=True)
