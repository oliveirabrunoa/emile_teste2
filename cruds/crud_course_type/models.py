from backend import db


class CourseType(db.Model):

    id = db.Column(db.Integer, primary_key=True)
    description = db.Column(db.String(50))

    def set_fields(self, fields):
        self.description = fields['description']

    def __repr__(self):
        return "insert into IFCOURSEYPE (course_type_id,course_type_description) values ({0},'{1}');".format(self.id, self.description)
