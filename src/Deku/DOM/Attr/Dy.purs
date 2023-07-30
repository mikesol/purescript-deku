module Deku.DOM.Attr.Dy where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Dy = Dy

instance Attr FeDropShadow_ Dy String where
  attr Dy bothValues  = unsafeAttribute $ Both { key: "dy", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "dy", value:  prop' value  })
  pureAttr Dy value  = unsafeAttribute $ This { key: "dy", value:  prop' value  }
  unpureAttr Dy eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "dy", value:  prop' value  }

instance Attr FeOffset_ Dy String where
  attr Dy bothValues  = unsafeAttribute $ Both { key: "dy", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "dy", value:  prop' value  })
  pureAttr Dy value  = unsafeAttribute $ This { key: "dy", value:  prop' value  }
  unpureAttr Dy eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "dy", value:  prop' value  }

instance Attr Text_ Dy String where
  attr Dy bothValues  = unsafeAttribute $ Both { key: "dy", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "dy", value:  prop' value  })
  pureAttr Dy value  = unsafeAttribute $ This { key: "dy", value:  prop' value  }
  unpureAttr Dy eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "dy", value:  prop' value  }

instance Attr Tspan_ Dy String where
  attr Dy bothValues  = unsafeAttribute $ Both { key: "dy", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "dy", value:  prop' value  })
  pureAttr Dy value  = unsafeAttribute $ This { key: "dy", value:  prop' value  }
  unpureAttr Dy eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "dy", value:  prop' value  }

instance Attr everything Dy Unit where
  attr Dy bothValues  = unsafeAttribute $ Both { key: "dy", value:  unset'  } (snd bothValues <#> \_ -> { key: "dy", value:  unset'  })
  pureAttr Dy _  = unsafeAttribute $ This { key: "dy", value:  unset'  }
  unpureAttr Dy eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "dy", value:  unset'  }
