use uni;
-- 1) Задачу 1 сделали в классе.
-- 2) Вывести имена всех преподавателей с их компетенциями
select
	t1.name,
    t3.title
from teachers t1
inner join teachers2competencies t2
on t1.id = t2.teacher_id
inner join competencies t3
on t2.competencies_id = t3.id;

-- 3) Найти преподавателя, у которого нет компетенций
select
	t1.name
from teachers t1
left join teachers2competencies t2
on t1.id = t2.teacher_id
where t2.teacher_id is null;

-- 4) Найти имена студентов, которые не проходят ни один курс
select
	t1.name
from students t1
left join students2courses t2
on t1.id = t2.student_id
where t2.student_id is null;

-- 5) Найти курсы, которые не посещает ни один студент
select
	t1.title
from courses t1
left join students2courses t2
on t1.id = t2.course_id
where t2.course_id is null;

-- 6) Найти компетенции, которых нет ни у одного преподавателя
select
	t1.title
from competencies t1
left join teachers2competencies t2
on t1.id = t2.competencies_id
where t2.competencies_id is null;

-- 7) Вывести имя студента и имена старост, которые есть на курсах, которые он проходит
select
	t1.name as student_name,
    t4.name as headman_name
from students t1
inner join students2courses t2
on t1.id = t2.student_id
inner join courses t3
on t2.course_id = t3.id
inner join students t4
on t3.headman_id = t4.id;