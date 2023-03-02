awk '/Startpoint|Endpoint/{print; getline; print}' all_timing_report.rpt > startend.txt
grep -B 1 'rising edge-triggered' startend.txt > allrising.txt
grep -B 2 -A 1 Endpoint allrising.txt > rising_edge.txt 
grep -B 3 'falling clock' startend.txt > falling_clock.txt
grep -B 3 'output port' startend.txt > output.txt
grep -B 3 'removal check' startend.txt > removal_check.txt
grep -B 3 'negative level' startend.txt > negative_level.txt
grep -B 3 'rising clock' startend.txt > rising_clock.txt

grep 'Startpoint' rising_edge.txt > rising_est.txt
sort -u rising_est.txt > rising_estartpoint.txt
awk '/Startpoint/ {print $2}' rising_estartpoint.txt > rising_eunique.txt
echo "***Unique result is $(wc -l rising_eunique.txt)" >> rising_eunique.txt 

grep 'Startpoint' falling_clock.txt > falling_st.txt
sort -u falling_st.txt > falling_startpoint.txt
awk '/Startpoint/ {print $2}' falling_startpoint.txt > falling_unique.txt
echo "***Unique result is $(wc -l falling_unique.txt)" >> falling_unique.txt 

grep 'Startpoint' rising_clock.txt > rising_cst.txt
sort -u rising_cst.txt > rising_cstartpoint.txt
awk '/Startpoint/ {print $2}' rising_cstartpoint.txt > rising_cunique.txt
echo "***Unique result is $(wc -l rising_cunique.txt)" >> rising_cunique.txt

grep 'Startpoint' removal_check.txt > removal_st.txt
sort -u removal_st.txt > removal_startpoint.txt
awk '/Startpoint/ {print $2}' removal_startpoint.txt > removal_unique.txt
echo "***Unique result is $(wc -l removal_unique.txt)" >> removal_unique.txt 

grep 'Startpoint' output.txt > output_st.txt
sort -u output_st.txt > output_startpoint.txt
awk '/Startpoint/ {print $2}' output_startpoint.txt > output_unique.txt
echo "***Unique result is $(wc -l output_unique.txt)" >> output_unique.txt

grep 'Startpoint' negative_level.txt > negative_st.txt
sort -u negative_st.txt > negative_startpoint.txt
awk '/Startpoint/ {print $2}' negative_startpoint.txt > negative_unique.txt
echo "***Unique result is $(wc -l negative_unique.txt)" >> negative_unique.txt
