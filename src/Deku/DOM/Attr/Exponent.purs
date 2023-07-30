module Deku.DOM.Attr.Exponent where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Exponent = Exponent

instance Attr FeFuncA_ Exponent String where
  attr Exponent bothValues  = unsafeAttribute $ Both { key: "exponent", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "exponent", value:  prop' value  })
  pureAttr Exponent value  = unsafeAttribute $ This { key: "exponent", value:  prop' value  }
  unpureAttr Exponent eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "exponent", value:  prop' value  }

instance Attr FeFuncB_ Exponent String where
  attr Exponent bothValues  = unsafeAttribute $ Both { key: "exponent", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "exponent", value:  prop' value  })
  pureAttr Exponent value  = unsafeAttribute $ This { key: "exponent", value:  prop' value  }
  unpureAttr Exponent eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "exponent", value:  prop' value  }

instance Attr FeFuncG_ Exponent String where
  attr Exponent bothValues  = unsafeAttribute $ Both { key: "exponent", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "exponent", value:  prop' value  })
  pureAttr Exponent value  = unsafeAttribute $ This { key: "exponent", value:  prop' value  }
  unpureAttr Exponent eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "exponent", value:  prop' value  }

instance Attr FeFuncR_ Exponent String where
  attr Exponent bothValues  = unsafeAttribute $ Both { key: "exponent", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "exponent", value:  prop' value  })
  pureAttr Exponent value  = unsafeAttribute $ This { key: "exponent", value:  prop' value  }
  unpureAttr Exponent eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "exponent", value:  prop' value  }

instance Attr everything Exponent Unit where
  attr Exponent bothValues  = unsafeAttribute $ Both { key: "exponent", value:  unset'  } (snd bothValues <#> \_ -> { key: "exponent", value:  unset'  })
  pureAttr Exponent _  = unsafeAttribute $ This { key: "exponent", value:  unset'  }
  unpureAttr Exponent eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "exponent", value:  unset'  }
