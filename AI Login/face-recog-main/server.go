package main

import (
	"io"
	"mime/multipart"
	"net/http"
	"os"
	"os/exec"
	"strings"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	e := echo.New()

	// Middleware untuk mengizinkan CORS
	e.Use(middleware.CORS())

	// Endpoint untuk register
	e.POST("/register", Register)

	// Endpoint untuk login
	e.POST("/login", Login)

	// Jalankan server di port 8080
	e.Start(":8080")
}

func Register(c echo.Context) error {
	// Menerima data nama dan foto dari permintaan POST
	nama := c.FormValue("nama")
	foto, err := c.FormFile("foto")
	if err != nil {
		return c.JSON(http.StatusBadRequest, map[string]string{
			"error": "Gagal membaca foto",
		})
	}

	// Simpan foto dengan nama yang unik
	fotoPath := generateUniqueFileName(foto.Filename)
	err = saveUploadedFile(foto, fotoPath)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, map[string]string{
			"error": "Gagal menyimpan foto",
		})
	}

	// Lakukan pengenalan wajah menggunakan Python
	namaDariPython, err := RecognizeFace(fotoPath)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, map[string]string{
			"error": "Gagal mengenali wajah",
		})
	}

	// Pastikan pengenalan wajah berhasil dan nama dari Python tidak kosong
	if strings.TrimSpace(namaDariPython) == "" {
		return c.JSON(http.StatusInternalServerError, map[string]string{
			"error": "Nama tidak terdeteksi",
		})
	}

	// Simpan data registrasi ke database atau penyimpanan yang sesuai
	// Di sini, Anda bisa menyimpan nama dan path foto ke database atau tempat penyimpanan yang sesuai.

	// Mengembalikan respons berhasil registrasi
	return c.JSON(http.StatusOK, map[string]string{
		"nama":   nama,
		"status": "Registrasi berhasil",
	})
}


func Login(c echo.Context) error {
	// Menerima data foto dari permintaan POST
	foto, err := c.FormFile("foto")
	if err != nil {
		return c.JSON(http.StatusBadRequest, map[string]string{
			"error": "Gagal membaca foto",
		})
	}

	// Simpan foto dengan nama yang unik
	fotoPath := generateUniqueFileName(foto.Filename)
	err = saveUploadedFile(foto, fotoPath)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, map[string]string{
			"error": "Gagal menyimpan foto",
		})
	}

	// Lakukan pengenalan wajah menggunakan Python
	namaDariPython, err := RecognizeFace(fotoPath)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, map[string]string{
			"error": "Gagal mengenali wajah",
		})
	}

	// Pastikan pengenalan wajah berhasil dan nama dari Python tidak kosong
	if strings.TrimSpace(namaDariPython) == "" {
		return c.JSON(http.StatusInternalServerError, map[string]string{
			"error": "Nama tidak terdeteksi",
		})
	}

	// Di sini, Anda dapat melakukan pengecekan apakah nama yang terdeteksi sesuai dengan data yang ada di database
	// Jika sesuai, maka pengguna dianggap berhasil login

	// Mengembalikan respons berhasil login
	return c.JSON(http.StatusOK, map[string]string{
		"nama":   namaDariPython,
		"status": "Anda berhasil login",
	})
}

func generateUniqueFileName(originalFileName string) string {
	// Generate unique filename based on timestamp
	return originalFileName
}

func saveUploadedFile(file *multipart.FileHeader, filePath string) error {
	src, err := file.Open()
	if err != nil {
		return err
	}
	defer src.Close()

	dst, err := os.Create(filePath)
	if err != nil {
		return err
	}
	defer dst.Close()

	if _, err = io.Copy(dst, src); err != nil {
		return err
	}
	return nil
}

func RecognizeFace(fotoPath string) (string, error) {
	// Menggunakan Python untuk pengenalan wajah
	cmd := exec.Command("python", "face_recognition.py", fotoPath)
	output, err := cmd.CombinedOutput()
	if err != nil {
		return "", err
	}

	// Mengambil nama dari output Python
	nama := string(output)
	return nama, nil
}
