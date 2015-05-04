
  CREATE OR REPLACE FORCE VIEW "FORMS"."VIEW_RAM" ("NAME", "FREQUENCY", "LATENCY", "STOCK", "PRICE") AS 
  SELECT 
    filtering.getRamName(ram.name, ram.vendor, ram.capacity, ram.clock) as Name, ram.clock as Frequency, ram.latency as Latency, ram.quantity as Stock, ram.price as Price
FROM
    ram, chipset
WHERE
    filtering.getRamName(ram.name, ram.vendor, ram.capacity, ram.clock) like '%' ||store.getRamName() || '%' and
    ram.ddrtype like chipset.ddrtype and 
    chipset.name like '%' || buy.getMoboChipset() || '%' and
    ram.clock <= buy.getMoboDdrClk() and   
    ram.clock = store.getRamClk() and
    ram.capacity = store.getRamCapacity() and
    ram.latency <= store.getRamLatency()

ORDER BY ram.price, ram.name;
 
