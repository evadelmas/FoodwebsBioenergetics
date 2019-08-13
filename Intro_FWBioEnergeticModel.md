# Modeling Food Webs Bioenergetics

## Mass Balance

**Conservation of mass**: in a closed physical system mass can neither be produced nor destroyed.

**Mass balance** is the application of the physical principle of conservation
of mass to the analysis of systems flux an stocks.

$$
storage = inputs - outputs
$$

which is equivalent to the following equation if we add the time dimension:

$$
m(t+\Delta t) = m(t) + m_{in}(t \rightarrow \Delta t) - m_{out}(t \rightarrow \Delta t)
$$

<div class="alert alert-block alert-info">
<b>Example: watershed</b>
<ul>
  <li>Input: Precipitation ($P$) and Groundwater flowing in ($GW_{in}$)</li>
  <li>Output: Evaporation ($E$), Evapotranspiration ($ET$), Groundwater flowing out ($GW_{out}$) and Runoff ($R$)</li>
  <li>Storage ($S$)</li>
</ul>

According to conservation of mass, $S = P + GW_{in} - (GW_{out} + E + ET + R)$
</div>

Inputs $m_{in}(t \rightarrow \Delta t)$ and outputs $m_{out}(t \rightarrow \Delta t)$
can both be decomposed in multiple terms to reflect the diversity of mechanisms
through which mass is transfered between the components of the system.

Instead of working with stocks (unit: mass), it is often desirable to study flux,
that is the rate at which mass enters/leaves the system. To do so, we can
simply move $m(t)$ to the left side of the equation and divide each term by $\Delta t$:

$$
\frac{m(t+\Delta t) - m(t)}{\Delta t} = \frac{m_{in}(t \rightarrow \Delta t)}{\Delta t} - \frac{m_{out}(t \rightarrow \Delta t)}{\Delta t}
$$

By doing so, we have now the mass accumulation rate on the left side of the equation, and only
inputs and outputs on the right side. This can be simplified:

$$
\frac{\Delta m}{\Delta t} = m_{in} - m_{out}
$$

This is the basic equation behind the bioenergetic model.

## The bioenergetic model

### Growth

### Consumption: the multi-species functional response

### Metabolism

## Parameterizing the model

## Assumptions and limits
