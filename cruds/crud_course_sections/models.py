from backend import db
from cruds.crud_courses.models import Courses


class CourseSections(db.Model):
    __tablename__ = 'course_sections'

    id = db.Column(db.Integer, primary_key=True)
    code = db.Column(db.String(20))
    name = db.Column(db.String(50))
    course_id = db.Column(db.Integer, db.ForeignKey('courses.id'))
    teacher_id = db.Column(db.Integer, db.ForeignKey('users.id'))
    course_section_period = db.Column(db.String(6))
    section_times = db.relationship("SectionTimes", backref='course_section', lazy='dynamic')

    def __repr__(self):
        return "insert into IFCOURSESECTIONS (course_section_id,course_sections_code,course_sections_name,course_sections_courses_id, course_sections_teacher_id,course_section_period) values ({0},'{1}','{2}',{3},{4},'{5}');".format(self.id, self.code, self.name, self.course_id, self.teacher_id,self.course_section_period)
