package com.bark.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Restaurant {
	/* @Setter(onMethod_ = @Autowired) */
	@Autowired
	private Chef chef;
}
