# go to saved path if there is one
if [[ -f ~/.saved_path~ ]]; then
  cd `cat ~/.saved_path~`
  rm ~/.saved_path~
fi