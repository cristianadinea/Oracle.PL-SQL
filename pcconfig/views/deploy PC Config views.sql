
  CREATE OR REPLACE FORCE VIEW "FORMS"."VIEW_CPU" ("NAME", "CORES", "FREQUENCY", "CACHE", "STOCK", "PRICE") AS 
  SELECT 
     filtering.getCpuName(cpu.name) as Name, cpu.cores as Cores, cpu.clock as Frequency, cpu.Cache as Cache, cpu.quantity as Stock, cpu.price as Price    
FROM
    cpu
WHERE
    cpu.name like '%' || store.getCpuName() || '%' and
    cpu.socket like '%' || store.getCpuSocket() || '%' and 
    cpu.clock >= store.getCpuClock() and
    cpu.cores >= store.getCpuCores() and
    cpu.power <= store.getCpuPower() and
    cpu.cache >= store.getCpuCache()
ORDER BY cpu.price, cpu.name;


  CREATE OR REPLACE FORCE VIEW "FORMS"."VIEW_MOBO" ("NAME", "CHIPSET", "USB3", "STOCK", "PRICE") AS 
  SELECT 
     filtering.getMoboName(mobo.name) as Name, mobo.chipset as Chipset, mobo.usb3 as USB3, mobo.quantity as Stock, mobo.price as Price
FROM
    mobo, chipset, socket
WHERE
    mobo.name like '%' || store.getMoboName() || '%' and
    mobo.chipset = chipset.name and
    chipset.socket = socket.name and
    socket.name like '%' || buy.getCpuSocket() || '%' and
    mobo.ddrclk >= store.getMoboDdrClk() and
    mobo.usb3 >= store.getMoboUsb3() and
    (chipset.sli >= store.getMoboDualVga() or chipset.xfire >= store.getMoboDualVga())

ORDER BY mobo.price, mobo.name;
 

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
 

 
