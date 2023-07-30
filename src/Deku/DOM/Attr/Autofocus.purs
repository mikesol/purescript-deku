module Deku.DOM.Attr.Autofocus where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Autofocus = Autofocus

instance Attr Button_ Autofocus String where
  attr Autofocus bothValues  = unsafeAttribute $ Both { key: "autofocus", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "autofocus", value:  prop' value  })
  pureAttr Autofocus value  = unsafeAttribute $ This { key: "autofocus", value:  prop' value  }
  unpureAttr Autofocus eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "autofocus", value:  prop' value  }

instance Attr Input_ Autofocus String where
  attr Autofocus bothValues  = unsafeAttribute $ Both { key: "autofocus", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "autofocus", value:  prop' value  })
  pureAttr Autofocus value  = unsafeAttribute $ This { key: "autofocus", value:  prop' value  }
  unpureAttr Autofocus eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "autofocus", value:  prop' value  }

instance Attr Select_ Autofocus String where
  attr Autofocus bothValues  = unsafeAttribute $ Both { key: "autofocus", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "autofocus", value:  prop' value  })
  pureAttr Autofocus value  = unsafeAttribute $ This { key: "autofocus", value:  prop' value  }
  unpureAttr Autofocus eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "autofocus", value:  prop' value  }

instance Attr Textarea_ Autofocus String where
  attr Autofocus bothValues  = unsafeAttribute $ Both { key: "autofocus", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "autofocus", value:  prop' value  })
  pureAttr Autofocus value  = unsafeAttribute $ This { key: "autofocus", value:  prop' value  }
  unpureAttr Autofocus eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "autofocus", value:  prop' value  }

instance Attr everything Autofocus Unit where
  attr Autofocus bothValues  = unsafeAttribute $ Both { key: "autofocus", value:  unset'  } (snd bothValues <#> \_ -> { key: "autofocus", value:  unset'  })
  pureAttr Autofocus _  = unsafeAttribute $ This { key: "autofocus", value:  unset'  }
  unpureAttr Autofocus eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "autofocus", value:  unset'  }
