package DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SeatDTO {
	private String theaterName;
	private int screenNumber;
	private String row;
	private String column;
	private String state;
	private String time;
	private String userID;
}
