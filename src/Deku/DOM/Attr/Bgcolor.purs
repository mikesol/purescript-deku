module Deku.DOM.Attr.Bgcolor where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Body (Body_)
import Deku.DOM.Elt.Col (Col_)
import Deku.DOM.Elt.Colgroup (Colgroup_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Tbody (Tbody_)
import Deku.DOM.Elt.Tfoot (Tfoot_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.DOM.Elt.Tr (Tr_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Bgcolor = Bgcolor

instance Attr Body_ Bgcolor String where
  attr Bgcolor bothValues  = unsafeAttribute $ Both { key: "bgcolor", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "bgcolor", value:  prop' value  })
  pureAttr Bgcolor value  = unsafeAttribute $ This { key: "bgcolor", value:  prop' value  }
  unpureAttr Bgcolor eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "bgcolor", value:  prop' value  }

instance Attr Col_ Bgcolor String where
  attr Bgcolor bothValues  = unsafeAttribute $ Both { key: "bgcolor", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "bgcolor", value:  prop' value  })
  pureAttr Bgcolor value  = unsafeAttribute $ This { key: "bgcolor", value:  prop' value  }
  unpureAttr Bgcolor eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "bgcolor", value:  prop' value  }

instance Attr Colgroup_ Bgcolor String where
  attr Bgcolor bothValues  = unsafeAttribute $ Both { key: "bgcolor", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "bgcolor", value:  prop' value  })
  pureAttr Bgcolor value  = unsafeAttribute $ This { key: "bgcolor", value:  prop' value  }
  unpureAttr Bgcolor eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "bgcolor", value:  prop' value  }

instance Attr Table_ Bgcolor String where
  attr Bgcolor bothValues  = unsafeAttribute $ Both { key: "bgcolor", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "bgcolor", value:  prop' value  })
  pureAttr Bgcolor value  = unsafeAttribute $ This { key: "bgcolor", value:  prop' value  }
  unpureAttr Bgcolor eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "bgcolor", value:  prop' value  }

instance Attr Tbody_ Bgcolor String where
  attr Bgcolor bothValues  = unsafeAttribute $ Both { key: "bgcolor", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "bgcolor", value:  prop' value  })
  pureAttr Bgcolor value  = unsafeAttribute $ This { key: "bgcolor", value:  prop' value  }
  unpureAttr Bgcolor eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "bgcolor", value:  prop' value  }

instance Attr Tfoot_ Bgcolor String where
  attr Bgcolor bothValues  = unsafeAttribute $ Both { key: "bgcolor", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "bgcolor", value:  prop' value  })
  pureAttr Bgcolor value  = unsafeAttribute $ This { key: "bgcolor", value:  prop' value  }
  unpureAttr Bgcolor eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "bgcolor", value:  prop' value  }

instance Attr Td_ Bgcolor String where
  attr Bgcolor bothValues  = unsafeAttribute $ Both { key: "bgcolor", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "bgcolor", value:  prop' value  })
  pureAttr Bgcolor value  = unsafeAttribute $ This { key: "bgcolor", value:  prop' value  }
  unpureAttr Bgcolor eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "bgcolor", value:  prop' value  }

instance Attr Th_ Bgcolor String where
  attr Bgcolor bothValues  = unsafeAttribute $ Both { key: "bgcolor", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "bgcolor", value:  prop' value  })
  pureAttr Bgcolor value  = unsafeAttribute $ This { key: "bgcolor", value:  prop' value  }
  unpureAttr Bgcolor eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "bgcolor", value:  prop' value  }

instance Attr Tr_ Bgcolor String where
  attr Bgcolor bothValues  = unsafeAttribute $ Both { key: "bgcolor", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "bgcolor", value:  prop' value  })
  pureAttr Bgcolor value  = unsafeAttribute $ This { key: "bgcolor", value:  prop' value  }
  unpureAttr Bgcolor eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "bgcolor", value:  prop' value  }

instance Attr everything Bgcolor Unit where
  attr Bgcolor bothValues  = unsafeAttribute $ Both { key: "bgcolor", value:  unset'  } (snd bothValues <#> \_ -> { key: "bgcolor", value:  unset'  })
  pureAttr Bgcolor _  = unsafeAttribute $ This { key: "bgcolor", value:  unset'  }
  unpureAttr Bgcolor eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "bgcolor", value:  unset'  }
