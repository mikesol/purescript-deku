module Deku.DOM.Attr.Values where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Values = Values

instance Attr Animate_ Values String where
  attr Values bothValues  = unsafeAttribute $ Both { key: "values", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "values", value:  prop' value  })
  pureAttr Values value  = unsafeAttribute $ This { key: "values", value:  prop' value  }
  unpureAttr Values eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "values", value:  prop' value  }

instance Attr AnimateMotion_ Values String where
  attr Values bothValues  = unsafeAttribute $ Both { key: "values", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "values", value:  prop' value  })
  pureAttr Values value  = unsafeAttribute $ This { key: "values", value:  prop' value  }
  unpureAttr Values eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "values", value:  prop' value  }

instance Attr AnimateTransform_ Values String where
  attr Values bothValues  = unsafeAttribute $ Both { key: "values", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "values", value:  prop' value  })
  pureAttr Values value  = unsafeAttribute $ This { key: "values", value:  prop' value  }
  unpureAttr Values eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "values", value:  prop' value  }

instance Attr FeColorMatrix_ Values String where
  attr Values bothValues  = unsafeAttribute $ Both { key: "values", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "values", value:  prop' value  })
  pureAttr Values value  = unsafeAttribute $ This { key: "values", value:  prop' value  }
  unpureAttr Values eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "values", value:  prop' value  }

instance Attr everything Values Unit where
  attr Values bothValues  = unsafeAttribute $ Both { key: "values", value:  unset'  } (snd bothValues <#> \_ -> { key: "values", value:  unset'  })
  pureAttr Values _  = unsafeAttribute $ This { key: "values", value:  unset'  }
  unpureAttr Values eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "values", value:  unset'  }
