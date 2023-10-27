.PHONY: clean

clean: 
	rm figures/*
 
figures/figure1.png figures/figure2.png: source_data/product_info.csv
	Rscript skeleton.R