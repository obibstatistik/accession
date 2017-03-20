select * from public.imusic limit 100;
select kind, count(*) from public.imusic group by kind;
select customerid, count(*) from public.imusic group by customerid;
select count(*) from public.imusic where preparation is not null and kind = 'Bøger';

select barcode, customerid, dateordered, dage, preparation, kind, lang, (
case

/* delaftale 1 danske bøger og noder */

when dage > 8 and preparation is not null and kind = 'Bøger' and lang = 'dan' then 'Forsinket' /* DK bøger */
when (dage between 1 and 7) and preparation is not null and kind = 'Bøger' and lang = 'dan' then 'Rettidig'
when dage > 16 and preparation is not null and kind = 'Bøger' and (lang != 'dan') then 'Forsinket'
when (dage between 1 and 15) and preparation is not null and kind = 'Bøger' and (lang != 'dan') then 'Rettidig'

/* Bøger - Børn - Klargjort, 1. sal 428070 */
/* Bøger - Børn - Uklargjort, 3. sal 428078 */
/* Bøger - Voksen Lån og Læs - Klargjort, 3. sal 436018 */
/* Bøger - Voksen - Klargjort, 1. sal 422451 */ 
/* Bøger - Voksen - Uklargjort, 3. sal 422454 */ 
/* Bøger - BørnGLS - Klargjort, 3. sal 428086 */
/* Bøger - Voksen - GLS - Klargjort, 3. sal 428094 */ 
/* Bøger - Danske noder - Klargjort, 3. sal 431174 */
/* Bøger - Børn Projekt - Uklargjort, 3. sal 428946 */
/* Bøger - Voksen Projekt - Uklargjort, 3. sal 428950 */


/* delaftale 5 film */
when customerid in ('430062','419035','430050') and dage > 7 then 'Forsinket Film' /* DK film uden klargøring */
when customerid in ('430062','419035','430050') and dage <= 7 then 'Rettidig Film' /* DK film med klargøring */
when customerid in ('430062','419035','430050') and dage > 7 then 'Forsinket Film' /* UDL film uden klargøring */
when customerid in ('430062','419035','430050') and dage > 7 then 'Forsinket Film' /* UDL film uden klargøring */
when customerid in ('430062','419035','430050') and dage = 0 then 'Ikke leveret'

/* delaftale 6 spil og multimedier */
when customerid = '430046' and dage > 7 then 'Forsinket Spil'
when customerid = '430030' and dage > 7 then 'Forsinket Spil'
   
else 'Ramt ved siden af'

end
/* */
) as status
from 
(
select barcode, customerid, dateordered, faustno, preparation, lang, kind, 
  (		
  select count(*) from datamart.arbejdsdage
  where dato between dateordered and dateshipped
  ) as dage
from imusic
join public.txtif on public.txtif.key = public.imusic.faustno 
where kind = 'Film'
) dk
order by dage desc;