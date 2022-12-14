[getList]
SELECT 
	rp.barangayid,
	rp.ry, 
	rp.section,
	MAX(rp.parcel) AS lastparcel,
	COUNT(*) as parcelcount
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid 
	INNER JOIN barangay b ON rp.barangayid = b.objid  
WHERE rp.barangayid = $P{objid}
  AND rp.ry = $P{ry} 
	AND f.state in ('CURRENT','CANCELLED')
  AND f.state like $P{state}
  AND r.rputype = 'land'
	${filter}
GROUP BY rp.barangayid, rp.ry, rp.section	
ORDER BY rp.section


[getFaasList]
select 
	f.objid,
	f.state,
	f.tdno,
	f.fullpin,
	f.titleno,
	rp.cadastrallotno,
	f.owner_name,
	f.owner_address,
	r.totalareasqm,
	r.totalareaha,
	r.totalmv,
	r.totalav,
	pc.code as class,
	r.taxable,
	f.txntype_objid
from faas f
	inner join rpu r on f.rpuid = r.objid 
	inner join propertyclassification pc on r.classification_objid = pc.objid 
	inner join realproperty rp on f.realpropertyid = rp.objid 
	inner join barangay b on rp.barangayid = b.objid  
where rp.barangayid = $P{barangayid}
  and rp.ry = $P{ry} 
  and rp.section = $P{section}
  AND f.state in ('CURRENT','CANCELLED')
  AND f.state like $P{state}
  and r.rputype = 'land'
	${filter}
order by f.fullpin  

[getRevisionYears]
SELECT ry FROM landrysetting ORDER BY ry 