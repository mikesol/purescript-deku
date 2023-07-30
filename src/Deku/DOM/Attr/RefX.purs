module Deku.DOM.Attr.RefX where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data RefX = RefX

instance Attr Marker_ RefX String where
  attr RefX bothValues  = unsafeAttribute $ Both { key: "refX", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "refX", value:  prop' value  })
  pureAttr RefX value  = unsafeAttribute $ This { key: "refX", value:  prop' value  }
  unpureAttr RefX eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "refX", value:  prop' value  }

instance Attr Symbol_ RefX String where
  attr RefX bothValues  = unsafeAttribute $ Both { key: "refX", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "refX", value:  prop' value  })
  pureAttr RefX value  = unsafeAttribute $ This { key: "refX", value:  prop' value  }
  unpureAttr RefX eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "refX", value:  prop' value  }

instance Attr everything RefX Unit where
  attr RefX bothValues  = unsafeAttribute $ Both { key: "refX", value:  unset'  } (snd bothValues <#> \_ -> { key: "refX", value:  unset'  })
  pureAttr RefX _  = unsafeAttribute $ This { key: "refX", value:  unset'  }
  unpureAttr RefX eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "refX", value:  unset'  }
