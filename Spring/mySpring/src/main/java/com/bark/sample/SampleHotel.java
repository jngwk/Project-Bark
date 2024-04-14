package com.bark.sample;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Component
@ToString
@Getter
//@AllArgsConstructor
@RequiredArgsConstructor
public class SampleHotel {
   @NonNull
   private Chef chef;
//   public SampleHotel(Chef chef) {
//       this.chef = chef;
//   }
}
