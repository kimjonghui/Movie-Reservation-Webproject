package Mapper;

import DTO.TheaterDTO;

import java.util.List;

import org.apache.ibatis.annotations.*;

@Mapper
public interface TheaterMapper {
    // 모든 상영관 리스트를 DB에서 찾아오는 메소드
    @Select("SELECT * FROM theater")
    @Results(id = "TheaterMapper", value = {
            @Result(property = "theaterName", column = "theaterName"),
            @Result(property = "address", column = "address"),
            @Result(property = "size", column = "size")
    })
    List<TheaterDTO> getAllTheaters();
}
