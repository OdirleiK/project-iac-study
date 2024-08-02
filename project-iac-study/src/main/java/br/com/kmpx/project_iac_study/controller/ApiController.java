package br.com.kmpx.project_iac_study.controller;

import java.time.Instant;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiController {
    

    @GetMapping
    public ResponseEntity<TimestampResponse> helloAws(){
        return ResponseEntity.ok(new TimestampResponse(Instant.now()));
    }
}
