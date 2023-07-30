module Deku.DOM.Attr.For where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Label (Label_)
import Deku.DOM.Elt.Output (Output_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data For = For

instance Attr Label_ For String where
  attr For bothValues  = unsafeAttribute $ Both { key: "for", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "for", value:  prop' value  })
  pureAttr For value  = unsafeAttribute $ This { key: "for", value:  prop' value  }
  unpureAttr For eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "for", value:  prop' value  }

instance Attr Output_ For String where
  attr For bothValues  = unsafeAttribute $ Both { key: "for", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "for", value:  prop' value  })
  pureAttr For value  = unsafeAttribute $ This { key: "for", value:  prop' value  }
  unpureAttr For eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "for", value:  prop' value  }

instance Attr everything For Unit where
  attr For bothValues  = unsafeAttribute $ Both { key: "for", value:  unset'  } (snd bothValues <#> \_ -> { key: "for", value:  unset'  })
  pureAttr For _  = unsafeAttribute $ This { key: "for", value:  unset'  }
  unpureAttr For eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "for", value:  unset'  }
