package com.spring_gradle.springgradle.repository;

import com.spring_gradle.springgradle.entity.HanRiver;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public interface HanRiverRepository extends JpaRepository<HanRiver,Long>
{
    HanRiver findByName(String name);

    @Query(value = "SELECT * FROM tbl_hanRiverInfo t ORDER BY 1 DESC LIMIT 1;", nativeQuery = true)
    HanRiver findLatestTop1Data();

    //"SELECT * FROM (SELECT no_, type, name, temperature, time, created FROM(SELECT @row_num \\:= IF(@prev_value=o.time,@row_num+1,1) AS RowNumber ,@prev_value \\:= o.no_, o.no_, o.name, o.type, o.temperature, o.time, o.created  FROM pparkst_db.tbl_hanRiverInfo o, (SELECT @row_num \\:= 1) x,  (SELECT @prev_value \\:= '') y  ORDER BY o.time DESC, o.created DESC )AS TBL WHERE RowNumber < 6 LIMIT 5 )T ORDER BY type ASC;"
    @Query(value ="SELECT * FROM \r" +
                    "( SELECT \r " +
                        "no_, type, name, temperature, time, created \r" +
                       "FROM ( \r" +
                           "SELECT \r" +
                            "@row_num \\:= IF(@prev_value=o.time,@row_num+1,1) AS RowNumber \r" + 
                            ",@prev_value \\:= o.no_ \r" +
                            ",o.no_, o.name, o.type, o.temperature, o.time, o.created \r" +
                            "FROM pparkst_db.tbl_hanRiverInfo o,\r" +
                                 "(SELECT @row_num \\:= 1) x, \r" +
                                 "(SELECT @prev_value \\:= '') y \r" +
                                 "ORDER BY o.time DESC, o.created DESC )AS TBL \r" + 
                                 "WHERE RowNumber < 6 LIMIT 5 )T ORDER BY type ASC;", nativeQuery = true)
    List<HanRiver> findLatestData();

}
 