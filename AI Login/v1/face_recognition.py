import cv2

# Inisialisasi detektor wajah menggunakan Cascade Classifier
face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')

# Membuka webcam
cap = cv2.VideoCapture(0)

while True:
    # Membaca frame dari webcam
    ret, frame = cap.read()

    # Mengonversi frame ke grayscale
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Mendeteksi wajah dalam frame
    faces = face_cascade.detectMultiScale(gray, scaleFactor=1.3, minNeighbors=5, minSize=(30, 30))

    for (x, y, w, h) in faces:
        # Menggambar kotak di sekitar wajah
        cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 2)
        
        # Menampilkan nama pada kotak wajah (Anda bisa menggantinya dengan pengenalan nama yang sesuai)
        cv2.putText(frame, 'Nama: Nama Anda', (x, y - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0, 255, 0), 2)

    # Menampilkan frame yang telah diolah
    cv2.imshow('Face Recognition', frame)

    # Menghentikan program jika tombol 'q' ditekan
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Menutup webcam dan menghentikan OpenCV
cap.release()
cv2.destroyAllWindows()
