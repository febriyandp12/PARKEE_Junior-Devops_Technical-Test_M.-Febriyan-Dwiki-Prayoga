import pandas as pd

# Baca semua file CSV
df_a = pd.read_csv("branch_a.csv")
print("Data dari branch_a.csv:")
print(df_a)
print("\n" + "="*80 + "\n")

df_b = pd.read_csv("branch_b.csv")
print("Data dari branch_b.csv:")
print(df_b)
print("\n" + "="*80 + "\n")

df_c = pd.read_csv("branch_c.csv")
print("Data dari branch_c.csv:")
print(df_c)
print("\n" + "="*80 + "\n")

# Gabungkan semua DataFrame
df = pd.concat([df_a, df_b, df_c], ignore_index=True)
print("Data setelah penggabungan:")
print(df)
print("\n" + "="*80 + "\n")

# Hapus baris dengan NaN pada kolom penting
df.dropna(subset=["transaction_id", "date", "customer_id"], inplace=True)
print("Data setelah menghapus baris dengan NaN pada 'transaction_id', 'date', atau 'customer_id':")
print(df)
print("\n" + "="*80 + "\n")

# Konversi kolom 'date' ke datetime
df["date"] = pd.to_datetime(df["date"])
print("Data setelah konversi kolom 'date' ke datetime:")
print(df)
print("\n" + "="*80 + "\n")

# Hapus duplikat berdasarkan transaction_id, simpan yang date-nya terbaru
df.sort_values("date", ascending=False, inplace=True)
df = df.drop_duplicates(subset=["transaction_id"], keep="first")
print("Data setelah menghapus duplikat berdasarkan 'transaction_id' dengan mempertahankan tanggal terbaru:")
print(df)
print("\n" + "="*80 + "\n")

# Hitung total (quantity * price)
df["total"] = df["quantity"] * df["price"]
print("Data setelah menambahkan kolom 'total' sebagai hasil perkalian 'quantity' dan 'price':")
print(df)
print("\n" + "="*80 + "\n")

# Hitung total per branch
total_sales = df.groupby("branch")["total"].sum().reset_index()
total_sales.columns = ["branch", "total"]
print("Total penjualan per cabang:")
print(total_sales)
print("\n" + "="*80 + "\n")

# Simpan hasil ke file baru
total_sales.to_csv("total_sales_per_branch.csv", index=False)
print("✅ Selesai! File 'total_sales_per_branch.csv' berhasil dibuat.")