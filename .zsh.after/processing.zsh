# Setup prun command as described at http://www.dsfcode.com/using-processing-via-the-command-line/
function prun {
  if [[ $1 != *'/..'* && $1 != *'../'* && $1 != '.'* && $1 != '/'* ]]
  then
    [[ $1 == "" ]] && sketch=`pwd`;
    [[ $1 != "" ]] && sketch=`pwd`"/"`echo $1 | sed 's;/$;;'`;

    processing-java --sketch="$sketch" --output="$sketch/.tmp_output" --run;
    rm -r "$sketch/.tmp_output";
  else
    echo 'ERROR: Please enter the path to your sketch relative to your current location, ".", "..", "~", and full paths will not work with this function';
    echo '       If you are in the sketch folder you want to run it, simply exicute prun with no arguments';
  fi
}

function psetup {
  sketch=$1;
  mkdir $sketch; touch $sketch/$sketch.pde; cd $sketch;
}
