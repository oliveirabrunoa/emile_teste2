import datetime
from backend import db


class SectionTimes(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    course_section_id = db.Column(db.Integer, db.ForeignKey('course_sections.id'), nullable=False)
    week_day = db.Column(db.Integer())
    section_time_start_time = db.Column(db.Time())
    section_time_finish_time = db.Column(db.Time())

    def __repr__(self):
        return "insert into IFSECTIONTIMES (section_time_id,section_times_course_sections_id,section_times_week_day,section_time_start_time, section_time_finish_time) values ({0},{1},{2},{3},{4});".format(self.id, self.course_section_id, self.week_day, self.section_time_start_time, self.section_time_finish_time)

    def set_fields(self, fields):
        self.course_section_id = fields['course_section_id']
        self.section_time_start_time = datetime.datetime.strptime(fields['section_time_start_time'], "%H:%M:%S").time()
        self.section_time_finish_time = datetime.datetime.strptime(fields['section_time_finish_time'], "%H:%M:%S", ).time()
        self.week_day = fields['week_day']
