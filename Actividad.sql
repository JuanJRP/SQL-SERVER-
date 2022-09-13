select * from Course where CourseNo like '%IS4%'

select FacFirstName, FacLastName, FacHireDate from Faculty where year(FacHireDate) between '1999' and '2000'

select FacFirstName, FacLastName, FacHireDate from Faculty where month(FacHireDate) = '03'

select OfferNo,CourseNo from Offering where FacSSN is null and OffTerm = 'SUMMER' and OffYear = 2006

select OffYear, OffTerm from Offering where (FacSSN is null and OfferNo like '56%') or (FacSSN is not null and OffDays = 'MW')

select OffLocation, OffYear from Offering where FacSSN is null and CourseNo like 'IS3%'

