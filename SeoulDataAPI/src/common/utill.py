from enum import Enum

class riverStrKey(Enum):
    Tancheon = 1
    JungNangCheon = 2
    AnyangCheon = 3
    SeonYoo = 4
    NoRyangJin = 5


    @classmethod
    def getRiverStrKey(cls, name):
        return {
            '탄천': cls.Tancheon,
            "중랑천": cls.JungNangCheon,
            "안양천": cls.AnyangCheon,
            "선유": cls.SeonYoo,
            "노량진": cls.NoRyangJin
        }.get(name, None)

