
  CREATE OR REPLACE FORCE VIEW "FORMS"."VIEW_VGA" ("NAME", "CHIPSET", "SERIES", "MEMORY", "BUS", "FREQUENCY", "STOCK", "PRICE") AS 
  SELECT 
     filtering.getVgaName(vga.name, vga.vendor) as Name, vga.chipset as Chipset, vga.series as Series, vga.gddr as Memory, vga.bus as Bus, vga.clock as Frequency, vga.quantity as Stock, vga.price as Price    
FROM
    vga
WHERE
    filtering.getVgaName(vga.name, vga.vendor) like '%' || store.getVgaName() || '%' and
    vga.chipset like '%' || store.getVgaChipset() || '%' and
    vga.series like '%' ||store.getVgaSeries() || '%' and
    vga.bus >= store.getVgaBus() and
    vga.gddr >= store.getVgaGddr() and
    vga.passive >= store.getVgaPassive()

ORDER BY vga.price, vga.name;
 
