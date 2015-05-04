
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
 
