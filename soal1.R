#1a
n = 3
p = 0.20
dgeom(x = n, prob = p)
#1b
mean(rgeom(n = 10000, prob = p) == 3)
#1c
#Hasil dari perhitungan a dan b tidak terlalu jauh, bedanya kalau a itu nilainya tetap
#sedangkan kalau b itu hasilnya random, besar kecil nilainya ditentukan oleh X

#1d
data.frame(x = 0:10, prob = dgeom(x = 0:10, prob = p)) %>%
  mutate(Failures = ifelse(x == n, n, "other")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Histogram Distribusi Geometrik,Peluang X = 3 gagal Sebelum Sukses Pertama",
       subtitle = "Geometric(.2)",
       x = "Kegagalan sebelum sukses yang pertama (x)",
       y = "Peluang") 

#1e
#Rataan
miu = 1/p
paste("Rataan adalah ", miu)
#varian
varian = (1-p)/ p^2
paste("varian adalah ", varian)