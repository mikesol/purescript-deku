module Deku.DOM.Attr.Minlength where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Minlength = Minlength

instance Attr Input_ Minlength String where
  attr Minlength bothValues  = unsafeAttribute $ Both { key: "minlength", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "minlength", value:  prop' value  })
  pureAttr Minlength value  = unsafeAttribute $ This { key: "minlength", value:  prop' value  }
  unpureAttr Minlength eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "minlength", value:  prop' value  }

instance Attr Textarea_ Minlength String where
  attr Minlength bothValues  = unsafeAttribute $ Both { key: "minlength", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "minlength", value:  prop' value  })
  pureAttr Minlength value  = unsafeAttribute $ This { key: "minlength", value:  prop' value  }
  unpureAttr Minlength eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "minlength", value:  prop' value  }

instance Attr everything Minlength Unit where
  attr Minlength bothValues  = unsafeAttribute $ Both { key: "minlength", value:  unset'  } (snd bothValues <#> \_ -> { key: "minlength", value:  unset'  })
  pureAttr Minlength _  = unsafeAttribute $ This { key: "minlength", value:  unset'  }
  unpureAttr Minlength eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "minlength", value:  unset'  }
