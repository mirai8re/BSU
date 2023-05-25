package com.example.my;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    private EditText inputNumber;
    private Button calculateButton;
    private TextView resultTextView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        inputNumber = findViewById(R.id.inputNumber);
        calculateButton = findViewById(R.id.calculateButton);
        resultTextView = findViewById(R.id.resultTextView);

        calculateButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                calculateArctan();
            }
        });
    }

    private void calculateArctan() {
        String inputText = inputNumber.getText().toString();
        if (!inputText.isEmpty()) {
            double number = Double.parseDouble(inputText);
            double arctanResult = Math.atan(number);
            resultTextView.setText("Результат: " + arctanResult);
        } else {
            resultTextView.setText("Введите число");
        }
    }
}