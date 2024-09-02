# 베이스 이미지로 Apache HTTP 서버 사용
FROM httpd:2.4

# 호스트의 index.html 파일을 컨테이너의 웹 루트 디렉토리로 복사
COPY index.html /usr/local/apache2/htdocs/
