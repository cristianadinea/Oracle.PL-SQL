
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
 
