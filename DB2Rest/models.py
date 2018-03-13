from DB2Rest.db import Base
from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship


class UserType(Base):
    __tablename__ = "IFUSERTYPE"

    id = Column('user_type_id',Integer,primary_key=True)
    name = Column('user_type_description')

    ##Relationships##
    users = relationship('Users',back_populates='type')



    def __init__(self, **kwargs):
        for k, v in kwargs.items():
            setattr(self, k, v)



class CourseType(Base):
    __tablename__ = "IFCOURSETYPE"

    id = Column('course_type_id',Integer,primary_key=True)
    description = Column('course_type_description')

    ##Relationships##
    courses = relationship('Courses',back_populates='course_type')



    def __init__(self, **kwargs):
        for k, v in kwargs.items():
            setattr(self, k, v)



class Institution(Base):
    __tablename__ = "IFINSTITUTION"

    id = Column('institution_id',Integer,primary_key=True)
    name = Column('institution_name')
    abbreviation = Column('institution_abbreviation')
    cnpj = Column('institution_cnpj')
    address = Column('institution_address')
    current_program_section = Column('institution_current_program_section')

    ##Relationships##
    programs = relationship('Program',back_populates='institution')



    def __init__(self, **kwargs):
        for k, v in kwargs.items():
            setattr(self, k, v)



class Program(Base):
    __tablename__ = "IFPROGRAM"

    id = Column('program_id',Integer,primary_key=True)
    name = Column('program_name')
    abbreviation = Column('program_abbreviation')
    total_hours = Column('program_total_hours')
    total_credits = Column('program_total_credits')

    ##Relationships##
    institution_id = Column('program_institution_id',Integer,ForeignKey('IFINSTITUTION.institution_id'))
    institution = relationship('Institution',back_populates='programs',lazy='joined')

    users = relationship('Users',back_populates='program')

    courses = relationship('Courses',back_populates='program')



    def __init__(self, **kwargs):
        for k, v in kwargs.items():
            setattr(self, k, v)



class Users(Base):
    __tablename__ = "IFUSERS"

    id = Column('users_id',Integer,primary_key=True)
    username = Column('users_username')
    email = Column('users_email')
    password = Column('users_password')
    birth_date = Column('users_birth_date')
    gender = Column('users_gender')
    address = Column('users_address')
    push_notification_token = Column('users_push_notification_token')
    image_path = Column('users_image_path')

    ##Relationships##
    type_id = Column('users_type',Integer,ForeignKey('IFUSERTYPE.user_type_id'))
    type = relationship('UserType',back_populates='users',lazy='joined')

    program_id = Column('users_program_id',Integer,ForeignKey('IFPROGRAM.program_id'))
    program = relationship('Program',back_populates='users',lazy='joined')

    course_sections = relationship('CourseSections',back_populates='teacher',uselist=False)



    def __init__(self, **kwargs):
        for k, v in kwargs.items():
            setattr(self, k, v)



class Courses(Base):
    __tablename__ = "IFCOURSES"

    id = Column('courses_id',Integer,primary_key=True)
    code = Column('courses_code')
    name = Column('courses_name')
    credits = Column('courses_credits')
    hours = Column('courses_hours')
    program_section = Column('courses_program_section')

    ##Relationships##
    course_type_id = Column('courses_course_type_id',Integer,ForeignKey('IFCOURSETYPE.course_type_id'))
    course_type = relationship('CourseType',back_populates='courses',lazy='joined')

    program_id = Column('courses_program_id',Integer,ForeignKey('IFPROGRAM.program_id'))
    program = relationship('Program',back_populates='courses',lazy='joined')

    course_sections = relationship('CourseSections',back_populates='course',uselist=False)



    def __init__(self, **kwargs):
        for k, v in kwargs.items():
            setattr(self, k, v)



class CourseSections(Base):
    __tablename__ = "IFCOURSESECTIONS"

    id = Column('course_section_id',Integer,primary_key=True)
    code = Column('course_sections_code')
    name = Column('course_sections_name')
    course_section_period = Column('course_section_period')

    ##Relationships##
    teacher_id = Column('course_sections_teacher_id',Integer,ForeignKey('IFUSERS.users_id'))
    teacher = relationship('Users',back_populates='course_sections')

    course_id = Column('course_sections_courses_id',Integer,ForeignKey('IFCOURSES.courses_id'))
    course = relationship('Courses',back_populates='course_sections')

    section_times = relationship('SectionTimes',back_populates='course_section')



    def __init__(self, **kwargs):
        for k, v in kwargs.items():
            setattr(self, k, v)



class SectionTimes(Base):
    __tablename__ = "IFSECTIONTIMES"

    id = Column('section_time_id',Integer,primary_key=True)
    week_day = Column('section_times_week_day')
    section_time_start_time = Column('section_time_start_time')
    section_time_finish_time = Column('section_time_finish_time')

    ##Relationships##
    course_section_id = Column('section_times_course_sections_id',Integer,ForeignKey('IFCOURSESECTIONS.course_section_id'))
    course_section = relationship('CourseSections',back_populates='section_times',lazy='joined')



    def __init__(self, **kwargs):
        for k, v in kwargs.items():
            setattr(self, k, v)
