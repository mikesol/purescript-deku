module Deku.DOM.Attr.FilterRes where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data FilterRes = FilterRes

instance Attr Filter_ FilterRes (NonEmpty.NonEmpty Event.Event  String ) where
  attr FilterRes bothValues = unsafeAttribute $ Both (pure 
    { key: "filterRes", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "filterRes", value: prop' value })
instance Attr Filter_ FilterRes (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FilterRes (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "filterRes", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "filterRes", value: prop' value })
instance Attr Filter_ FilterRes  String  where
  attr FilterRes value = unsafeAttribute $ This $ pure $
    { key: "filterRes", value: prop' value }
instance Attr Filter_ FilterRes (Event.Event  String ) where
  attr FilterRes eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filterRes", value: prop' value }

instance Attr Filter_ FilterRes (ST.ST Global.Global  String ) where
  attr FilterRes stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "filterRes", value: prop' value }

instance Attr everything FilterRes (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr FilterRes bothValues = unsafeAttribute $ Both (pure 
    { key: "filterRes", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "filterRes", value: unset' })
instance Attr everything FilterRes (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr FilterRes (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "filterRes", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "filterRes", value: unset' })
instance Attr everything FilterRes  Unit  where
  attr FilterRes _ = unsafeAttribute $ This $ pure $
    { key: "filterRes", value: unset' }
instance Attr everything FilterRes (Event.Event  Unit ) where
  attr FilterRes eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "filterRes", value: unset' }

instance Attr everything FilterRes (ST.ST Global.Global  Unit ) where
  attr FilterRes stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "filterRes", value: unset' }
