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
