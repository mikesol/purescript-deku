module Deku.DOM.Attr.Datetime where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Del (Del_)
import Deku.DOM.Elt.Ins (Ins_)
import Deku.DOM.Elt.Time (Time_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Datetime = Datetime

instance Attr Del_ Datetime String where
  attr Datetime bothValues  = unsafeAttribute $ Both { key: "datetime", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "datetime", value:  prop' value  })
  pureAttr Datetime value  = unsafeAttribute $ This { key: "datetime", value:  prop' value  }
  unpureAttr Datetime eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "datetime", value:  prop' value  }

instance Attr Ins_ Datetime String where
  attr Datetime bothValues  = unsafeAttribute $ Both { key: "datetime", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "datetime", value:  prop' value  })
  pureAttr Datetime value  = unsafeAttribute $ This { key: "datetime", value:  prop' value  }
  unpureAttr Datetime eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "datetime", value:  prop' value  }

instance Attr Time_ Datetime String where
  attr Datetime bothValues  = unsafeAttribute $ Both { key: "datetime", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "datetime", value:  prop' value  })
  pureAttr Datetime value  = unsafeAttribute $ This { key: "datetime", value:  prop' value  }
  unpureAttr Datetime eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "datetime", value:  prop' value  }

instance Attr everything Datetime Unit where
  attr Datetime bothValues  = unsafeAttribute $ Both { key: "datetime", value:  unset'  } (snd bothValues <#> \_ -> { key: "datetime", value:  unset'  })
  pureAttr Datetime _  = unsafeAttribute $ This { key: "datetime", value:  unset'  }
  unpureAttr Datetime eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "datetime", value:  unset'  }
