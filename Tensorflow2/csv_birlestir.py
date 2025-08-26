import pandas as pd

def iki_csv_birlestir(dosya1, dosya2, hedef_dosya):
    # İlk CSV dosyasını oku
    veri1 = pd.read_csv(dosya1)

    # İkinci CSV dosyasını oku
    veri2 = pd.read_csv(dosya2)

    # İki veri setini birleştir
    birlesik_veri = pd.concat([veri1, veri2], ignore_index=True)

    # Birleştirilmiş veriyi hedef dosyaya kaydet
    birlesik_veri.to_csv(hedef_dosya, index=False)
    print("İki CSV dosyası birleştirildi ve {} olarak kaydedildi.".format(hedef_dosya))

# Kullanım örneği
dosya1 = 'path/to/first/file.csv'    # İlk CSV dosyasının dosya yolu
dosya2 = 'path/to/second/file.csv'   # İkinci CSV dosyasının dosya yolu
hedef_dosya = 'path/to/output/merged_data.csv'  # Birleştirilmiş verinin kaydedileceği dosya yolu

iki_csv_birlestir(dosya1, dosya2, hedef_dosya)
