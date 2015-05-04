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
