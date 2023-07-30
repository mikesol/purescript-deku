module Deku.DOM.Attr.Integrity where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Integrity = Integrity

instance Attr Link_ Integrity String where
  attr Integrity bothValues  = unsafeAttribute $ Both { key: "integrity", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "integrity", value:  prop' value  })
  pureAttr Integrity value  = unsafeAttribute $ This { key: "integrity", value:  prop' value  }
  unpureAttr Integrity eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "integrity", value:  prop' value  }

instance Attr Script_ Integrity String where
  attr Integrity bothValues  = unsafeAttribute $ Both { key: "integrity", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "integrity", value:  prop' value  })
  pureAttr Integrity value  = unsafeAttribute $ This { key: "integrity", value:  prop' value  }
  unpureAttr Integrity eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "integrity", value:  prop' value  }

instance Attr everything Integrity Unit where
  attr Integrity bothValues  = unsafeAttribute $ Both { key: "integrity", value:  unset'  } (snd bothValues <#> \_ -> { key: "integrity", value:  unset'  })
  pureAttr Integrity _  = unsafeAttribute $ This { key: "integrity", value:  unset'  }
  unpureAttr Integrity eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "integrity", value:  unset'  }
