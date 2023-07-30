module Deku.DOM.Attr.Accept where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Accept = Accept

instance Attr Form_ Accept String where
  attr Accept bothValues  = unsafeAttribute $ Both { key: "accept", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "accept", value:  prop' value  })
  pureAttr Accept value  = unsafeAttribute $ This { key: "accept", value:  prop' value  }
  unpureAttr Accept eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "accept", value:  prop' value  }

instance Attr Input_ Accept String where
  attr Accept bothValues  = unsafeAttribute $ Both { key: "accept", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "accept", value:  prop' value  })
  pureAttr Accept value  = unsafeAttribute $ This { key: "accept", value:  prop' value  }
  unpureAttr Accept eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "accept", value:  prop' value  }

instance Attr everything Accept Unit where
  attr Accept bothValues  = unsafeAttribute $ Both { key: "accept", value:  unset'  } (snd bothValues <#> \_ -> { key: "accept", value:  unset'  })
  pureAttr Accept _  = unsafeAttribute $ This { key: "accept", value:  unset'  }
  unpureAttr Accept eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "accept", value:  unset'  }
