CREATE OR REPLACE PACKAGE BUY AS 

cpuName cpu.name%type := '';

procedure setCpuName(var in cpu.name%type);
function getCpuName return cpu.name%type;
function existsCpu(var cpu.name%type) return number;
function getCpuSocket return cpu.socket%type;

moboName mobo.name%type := '';

procedure setMoboName(var in mobo.name%type);
function getMoboName return mobo.name%type;
function existsMobo(var mobo.name%type) return number;
function getMoboChipset return mobo.chipset%type;
function getMoboDdrClk return mobo.ddrclk%type;

ramName ram.name%type := '';

procedure setRamName(var in ram.name%type);
function getRamName return ram.name%type;
function existsRam(var ram.name%type) return number;

vgaName vga.name%type := '';

procedure setVgaName(var in vga.name%type);
function getVgaName return vga.name%type;
function existsVga(var vga.name%type) return number;


function getFinalCost return number;

END BUY;
/


CREATE OR REPLACE PACKAGE BODY BUY AS

-- cpu.name
function getCpuName return cpu.name%type is begin
  return cpuName;
end;
procedure setCpuName(var in cpu.name%type) is begin
  cpuName := var;
end;
function existsCpu(var cpu.name%type) return number is
  num number := 0;
begin
  select count(*) into num from view_cpu where name like var and stock > 0;  
  return num;
end;

function getCpuSocket return cpu.socket%type is 
  isocket cpu.socket%type := '';  
begin
  select cpu.socket into isocket from cpu where cpu.name like buy.getCpuName();
  return isocket;
end;

-- mobo.name
function getMoboName return mobo.name%type is begin
  return moboName;
end;
procedure setMoboName(var in mobo.name%type) is begin
  moboName := var;
end;
function existsMobo(var mobo.name%type) return number is
  num number := 0;
begin
  select count(*) into num from view_mobo where name like var and stock > 0; 
  return num;
end;
function getMoboChipset return mobo.chipset%type is
  ichipset mobo.chipset%type := '';  
begin
  select mobo.chipset into ichipset from mobo where mobo.name like buy.getMoboName();
  return ichipset;
end;
function getMoboDdrClk return mobo.ddrclk%type is
  iddrclk mobo.ddrclk%type := 0;  
begin
  select mobo.ddrclk into iddrclk from mobo where mobo.name like buy.getMoboName();
  return iddrclk;
end;

-- ram.name
function getRamName return ram.name%type is begin
  return ramName;
end;
procedure setRamName(var in ram.name%type) is begin
  ramName := var;
end;
function existsRam(var ram.name%type) return number is
  num number := 0;
begin
  select count(*) into num from view_ram where name like var and stock > 0;
  return num;
end;

-- vga.name
function getVgaName return vga.name%type is begin
  return vgaName;
end;
procedure setVgaName(var in vga.name%type) is begin
  vgaName := var;
end;
function existsVga(var vga.name%type) return number is
  num number := 0;
begin
  select count(*) into num from view_vga where name like var and stock > 0;
  return num;
end;

function getFinalCost return number is 
  total number := 0;
  aux number := 0;
begin
  select price into aux from cpu where name like cpuName;
  total := total + aux;
  select price into aux from mobo where name like moboName;
  total := total + aux;
  select price into aux from ram 
    where filtering.getRamName(ram.name, ram.vendor, ram.capacity, ram.clock) like ramName;
  total := total + aux;
  select price into aux from vga
    where filtering.getVgaName(vga.name, vga.vendor) like vgaName;
  total := total + aux;
  
  return total;
end;

END BUY;
/

CREATE OR REPLACE PACKAGE FILTERING AS 

function getImageDir return varchar2;
function getCpuName (cpuName cpu.name%type) return varchar2;
function getMoboName(moboName mobo.name%type) return varchar2;
function getRamName (ramName ram.name%type, ramVendor ram.vendor%type, ramSize ram.capacity%type, ramClock ram.clock%type) return varchar2;
function getVgaName (vgaName vga.name%type, vgaVendor vga.vendor%type) return varchar2;

END FILTERING;
/


CREATE OR REPLACE PACKAGE BODY FILTERING AS

function getImageDir return varchar2 is
begin
  return 'C:\\Documents and Settings\\forms\\My Documents\\pcconfig\\images\\';
end;

function getCpuName (cpuName cpu.name%type) return varchar2 is
begin
  return cpuName;
end getCpuName;
function getMoboName(moboName mobo.name%type) return varchar2 is 
begin
  return moboName;
end getMoboName;
function getRamName (ramName ram.name%type, ramVendor ram.vendor%type, ramSize ram.capacity%type, ramClock ram.clock%type) return varchar2 is
begin
  return ramVendor || ' ' || ramName || ' ' || ramSize || 'gb ' || ramClock || ' mhz';
end getRamName;
function getVgaName (vgaName vga.name%type, vgaVendor vga.vendor%type) return varchar2 is
begin
  return vgaVendor || ' ' || vgaName;
end getVgaName;

END FILTERING;
/

CREATE OR REPLACE PACKAGE STORE AS 

cpuName cpu.name%type := '';
cpuSocket cpu.socket%type := '';
cpuClock cpu.clock%type := 0;
cpuPower cpu.power%type := 9999;
cpuCache cpu.cache%type := 0;
cpuCores cpu.cores%type := 0;

procedure setCpuName(var in cpu.name%type);
function getCpuName return cpu.name%type;

procedure setCpuSocket(var in cpu.socket%type);
function getCpuSocket return cpu.socket%type;

procedure setCpuClock(var in cpu.clock%type);
function getCpuClock return cpu.clock%type;

procedure setCpuCores(var in cpu.cores%type);
function getCpuCores return cpu.cores%type;

procedure setCpuPower(var in cpu.power%type);
function getCpuPower return cpu.power%type;

procedure setCpuCache(var in cpu.cache%type);
function getCpuCache return cpu.cache%type;

procedure decreaseCpuQ(var in cpu.name%type);
procedure increaseCpuQ(var in cpu.name%type);

moboName mobo.name%type := '';
moboChipset mobo.chipset%type := '';
moboDdrClk mobo.ddrclk%type := 0;
moboUsb3 mobo.usb3%type := 0;
moboDualVga chipset.sli%type := 0;

procedure setMoboName(var in mobo.name%type);
function getMoboName return mobo.name%type;

procedure setMoboChipset(var in mobo.chipset%type);
function getMoboChipset return mobo.chipset%type;

procedure setMoboDdrClk(var in mobo.ddrclk%type);
function getMoboDdrClk return mobo.ddrclk%type;

procedure setMoboUsb3(var in mobo.usb3%type);
function getMoboUsb3 return mobo.usb3%type;

procedure setMoboDualVga(var in chipset.sli%type);
function getMoboDualVga return chipset.sli%type;

procedure decreaseMoboQ(var in mobo.name%type);
procedure increaseMoboQ(var in mobo.name%type);

ramName ram.name%type := '';
ramClk ram.clock%type := 1600;
ramSize ram.capacity%type := 4;
ramLat ram.latency%type := 99;

procedure setRamName(var in ram.name%type);
function getRamName return ram.name%type;

procedure setRamClk(var in ram.clock%type);
function getRamClk return ram.clock%type;

procedure setRamLatency(var in ram.latency%type);
function getRamLatency return ram.latency%type;

procedure setRamCapacity(var in ram.capacity%type);
function getRamCapacity return ram.capacity%type;

procedure decreaseRamQ(var in ram.name%type);
procedure increaseRamQ(var in ram.name%type);

vgaName vga.name%type := '';
vgaChipset vga.chipset%type := '';
vgaSeries vga.series%type := '';
vgaBus vga.bus%type := 0;
vgaGddr vga.gddr%type := 0;
vgaPassive vga.passive%type := 0;

procedure setVgaName(var in vga.name%type);
function getVgaName return vga.name%type;

procedure setVgaChipset(var in vga.chipset%type);
function getVgaChipset return vga.chipset%type;

procedure setVgaSeries(var in vga.series%type);
function getVgaSeries return vga.series%type;

procedure setVgaBus(var in vga.bus%type);
function getVgaBus return vga.bus%type;

procedure setVgaGddr(var in vga.gddr%type);
function getVgaGddr return vga.gddr%type;

procedure setVgaPassive(var in vga.passive%type);
function getVgaPassive return vga.passive%type;

procedure decreaseVgaQ(var in vga.name%type);
procedure increaseVgaQ(var in vga.name%type);



clientName client.name%type := '';

function clientExists(cName client.name%type, cPass client.password%type) return client.rights%type;
procedure setClientName(var in client.name%type);
function getClientName return client.name%type;
function getClientEmail return client.email%type;
function getLoginInfo return varchar2;

END STORE;
/


CREATE OR REPLACE PACKAGE BODY STORE AS

-- cpu.name
function getCpuName return cpu.name%type is begin
  return cpuName;
end;
procedure setCpuName(var in cpu.name%type) is begin
  cpuName := var;
end;
-- cpu.socket
function getCpuSocket return cpu.socket%type is begin
  return cpuSocket;
end;
procedure setCpuSocket(var in cpu.socket%type) is begin
  cpuSocket := var;
end;
-- cpu.clock
function getCpuClock return cpu.clock%type is begin
  if cpuClock = 0 then
    return 0;
  else
    if cpuSocket like '1155' then
      return 3100;
    elsif cpuSocket like '1366' then
      return 3000;  
    elsif cpuSocket like '1156' then
      return 3200;    
    elsif cpuSocket like 'am2' then
      return 9999;  
    elsif cpuSocket like 'am3' then
      return 3200;  
    else
      return 3000;
    end if;
  end if;
end;
procedure setCpuClock(var in cpu.clock%type) is begin
  cpuClock := var;
end;
-- cpu.cores
function getCpuCores return cpu.cores%type is begin
  return cpuCores;
end;
procedure setCpuCores(var in cpu.cores%type) is begin
  cpuCores := var;
end;
-- cpu.power
function getCpuPower return cpu.power%type is begin
  return cpuPower;
end;
procedure setCpuPower(var in cpu.Power%type) is begin
  cpuPower := var;
end;
-- cpu.cache
function getCpuCache return cpu.cache%type is begin
  return cpuCache;
end;
procedure setCpuCache(var in cpu.Cache%type) is begin
  cpuCache := var;
end;

-- mobo.name
function getMoboName return mobo.name%type is begin
  return moboName;
end;
procedure setMoboName(var in mobo.name%type) is begin
  moboName := var;
end;
-- mobo.chipset
function getMoboChipset return mobo.chipset%type is begin
  return moboChipset;
end;
procedure setMoboChipset(var in mobo.chipset%type) is begin
  moboChipset := var;
end;
-- mobo.ddrclk
function getMoboDdrClk return mobo.ddrclk%type is begin
  return moboDdrClk;
end;
procedure setMoboDdrClk(var in mobo.ddrclk%type) is begin
  moboDdrClk := var;
end;
-- mobo.usb3
function getMoboUsb3 return mobo.usb3%type is begin
  return moboUsb3;
end;
procedure setMoboUsb3(var in mobo.usb3%type) is begin
  moboUsb3 := var;
end;
-- mobo.dualvga
function getMoboDualVga return chipset.sli%type is begin
  return moboDualVga;
end;
procedure setMoboDualVga(var in chipset.sli%type) is begin
  moboDualVga := var;
end;

-- mobo.name
function getRamName return ram.name%type is begin
  return ramName;
end;
procedure setRamName(var in ram.name%type) is begin
  ramName := var;
end;
-- ram.clk
function getRamClk return ram.clock%type is begin
  return ramClk;
end;
procedure setRamClk(var in ram.clock%type) is begin
  ramClk := var;
end;
-- ram.latency
function getRamLatency return ram.latency%type is begin
  if ramLat = 0 then
    return 99;
  else
    if ramClk = 800 then
      return 4;
    elsif ramClk = 1066 then
      return 5;  
    elsif ramClk = 1333 then
      return 8;    
    elsif ramClk = 1600 then
      return 8;  
    elsif ramClk = 1866 then
      return 8;  
    elsif ramClk = 2000 then
      return 9;  
    elsif ramClk = 2200 then
      return 9;  
    else
      return 99;
    end if;
  end if;
end;
procedure setRamLatency(var in ram.Latency%type) is begin
  ramLat := var;
end;
-- ram.capacity
function getRamCapacity return ram.capacity%type is begin
  return ramSize;
end;
procedure setRamCapacity(var in ram.capacity%type) is begin
  ramSize := var;
end;

-- vga.name
function getVgaName return vga.name%type is begin
  return vgaName;
end;
procedure setVgaName(var in vga.name%type) is begin
  vgaName := var;
end;
-- vga.chipset
function getVgaChipset return vga.chipset%type is begin
  return vgaChipset;
end;
procedure setVgaChipset(var in vga.chipset%type) is begin
  vgaChipset := var;
end;
-- vga.series
function getVgaSeries return vga.series%type is begin
  return vgaSeries;
end;
procedure setVgaSeries(var in vga.series%type) is begin
  vgaSeries := var;
end;
-- vga.bus
function getVgaBus return vga.bus%type is begin
  return vgaBus;
end;
procedure setVgaBus(var in vga.bus%type) is begin
  vgaBus := var;
end;
-- vga.gddr
function getVgaGddr return vga.gddr%type is begin
  return vgaGddr;
end;
procedure setVgaGddr(var in vga.gddr%type) is begin
  vgaGddr := var;
end;
-- vga.passive
function getVgaPassive return vga.passive%type is begin
  return vgaPassive;
end;
procedure setVgaPassive(var in vga.passive%type) is begin
  vgaPassive := var;
end;

-- update stock
procedure decreaseCpuQ(var in cpu.name%type) is begin
  update cpu set quantity = quantity - 1 where cpu.name = var;
end;
procedure increaseCpuQ(var in cpu.name%type) is begin
  update cpu set quantity = quantity + 1 where cpu.name = var;
end;

procedure decreaseMoboQ(var in mobo.name%type) is begin
  update mobo set quantity = quantity - 1 where mobo.name = var;
end;
procedure increaseMoboQ(var in mobo.name%type) is begin
  update mobo set quantity = quantity + 1 where mobo.name = var;
end;

procedure decreaseRamQ(var in ram.name%type) is begin
  update ram set quantity = quantity - 1 
    where filtering.getRamName(ram.name, ram.vendor, ram.capacity, ram.clock) = var;
end;
procedure increaseRamQ(var in ram.name%type) is begin
  update ram set quantity = quantity + 1 
    where filtering.getRamName(ram.name, ram.vendor, ram.capacity, ram.clock) = var;
end;

procedure decreaseVgaQ(var in vga.name%type) is begin
  update vga set quantity = quantity - 1 
    where filtering.getVgaName(vga.name, vga.vendor) = var;
end;
procedure increaseVgaQ(var in vga.name%type) is begin
  update vga set quantity = quantity + 1 
    where filtering.getVgaName(vga.name, vga.vendor) = var;
end;

function clientExists(cName client.name%type, cPass client.password%type) return 
    client.rights%type is
    r client.rights%type := 0;
    n number := 0;
begin
    select count(*) into n from client
		where name like cName and password like cPass;

    if n = 1 then
    	select rights into r from client
    	where name like cName and password like cPass;
    else
      r := 0;
    end if;
    
    return r;
end;
function getClientName return client.name%type is begin
  return clientName;
end;
procedure setClientName(var in client.name%type) is begin
  clientName := var;
end;
function getClientEmail return client.email%type is 
  mail client.email%type := '';
begin
  select client.email into mail from client where client.name = store.getClientName();  
  return mail;
end;
function getLoginInfo return varchar2 is 
  name client.name%type;
begin
  name := store.getClientName();
  
  if name is null then
    return 'Not logged in';
  else
    return 'Logged in as ' || name;
  end if;
  
end;


END STORE;
/
