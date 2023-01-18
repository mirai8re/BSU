package anna.restAPI.scientific;


import static anna.restAPI.model.ResultBuilder.getResult;
import static anna.restAPI.model.ResultBuilder.getResultFromError;


import java.math.BigDecimal;
import java.math.BigInteger;

import anna.restAPI.model.ApiResult;
import anna.restAPI.scientific.ScientificCalculator;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/scientific")
public class ScientificController {

    private final ScientificCalculator _scientificCalculator;

    public ScientificController(ScientificCalculator scientificCalculator) {
        _scientificCalculator = scientificCalculator;
    }

    @GetMapping("/square/{factor}")
    public ApiResult square(@PathVariable BigDecimal factor ) {
        return (ApiResult) getResult(factor.multiply(factor));
    }

    @GetMapping("/factorial/{number}")
    public ApiResult factorial(@PathVariable int number ) {
        try {
            BigInteger factorial = _scientificCalculator.calculateFactorial(number);
            return (ApiResult) getResult(factorial);
        }
        catch ( ArithmeticException e ) {
            return getResultFromError(e.getMessage());
        }
    }

    @GetMapping("/prime/{number}")
    public ApiResult prime(@PathVariable long number ) {
        return (ApiResult) getResult(_scientificCalculator.isPrime(number));
    }
}