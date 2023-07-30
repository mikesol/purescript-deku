module Deku.DOM.Attr.Hreflang where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Link (Link_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Hreflang = Hreflang

instance Attr A_ Hreflang String where
  attr Hreflang bothValues  = unsafeAttribute $ Both { key: "hreflang", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "hreflang", value:  prop' value  })
  pureAttr Hreflang value  = unsafeAttribute $ This { key: "hreflang", value:  prop' value  }
  unpureAttr Hreflang eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "hreflang", value:  prop' value  }

instance Attr Area_ Hreflang String where
  attr Hreflang bothValues  = unsafeAttribute $ Both { key: "hreflang", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "hreflang", value:  prop' value  })
  pureAttr Hreflang value  = unsafeAttribute $ This { key: "hreflang", value:  prop' value  }
  unpureAttr Hreflang eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "hreflang", value:  prop' value  }

instance Attr Link_ Hreflang String where
  attr Hreflang bothValues  = unsafeAttribute $ Both { key: "hreflang", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "hreflang", value:  prop' value  })
  pureAttr Hreflang value  = unsafeAttribute $ This { key: "hreflang", value:  prop' value  }
  unpureAttr Hreflang eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "hreflang", value:  prop' value  }

instance Attr everything Hreflang Unit where
  attr Hreflang bothValues  = unsafeAttribute $ Both { key: "hreflang", value:  unset'  } (snd bothValues <#> \_ -> { key: "hreflang", value:  unset'  })
  pureAttr Hreflang _  = unsafeAttribute $ This { key: "hreflang", value:  unset'  }
  unpureAttr Hreflang eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "hreflang", value:  unset'  }
