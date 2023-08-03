module Deku.DOM.Attr.SpreadMethod where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SpreadMethod = SpreadMethod

instance Attr LinearGradient_ SpreadMethod (NonEmpty.NonEmpty Event.Event  String ) where
  attr SpreadMethod bothValues = unsafeAttribute $ Both (pure 
    { key: "spreadMethod", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "spreadMethod", value: prop' value })
instance Attr LinearGradient_ SpreadMethod (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SpreadMethod (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "spreadMethod", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "spreadMethod", value: prop' value })
instance Attr LinearGradient_ SpreadMethod  String  where
  attr SpreadMethod value = unsafeAttribute $ This $ pure $
    { key: "spreadMethod", value: prop' value }
instance Attr LinearGradient_ SpreadMethod (Event.Event  String ) where
  attr SpreadMethod eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "spreadMethod", value: prop' value }

instance Attr LinearGradient_ SpreadMethod (ST.ST Global.Global  String ) where
  attr SpreadMethod stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "spreadMethod", value: prop' value }

instance Attr RadialGradient_ SpreadMethod (NonEmpty.NonEmpty Event.Event  String ) where
  attr SpreadMethod bothValues = unsafeAttribute $ Both (pure 
    { key: "spreadMethod", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "spreadMethod", value: prop' value })
instance Attr RadialGradient_ SpreadMethod (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr SpreadMethod (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "spreadMethod", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "spreadMethod", value: prop' value })
instance Attr RadialGradient_ SpreadMethod  String  where
  attr SpreadMethod value = unsafeAttribute $ This $ pure $
    { key: "spreadMethod", value: prop' value }
instance Attr RadialGradient_ SpreadMethod (Event.Event  String ) where
  attr SpreadMethod eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "spreadMethod", value: prop' value }

instance Attr RadialGradient_ SpreadMethod (ST.ST Global.Global  String ) where
  attr SpreadMethod stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "spreadMethod", value: prop' value }

instance Attr everything SpreadMethod (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr SpreadMethod bothValues = unsafeAttribute $ Both (pure 
    { key: "spreadMethod", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "spreadMethod", value: unset' })
instance Attr everything SpreadMethod (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr SpreadMethod (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "spreadMethod", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "spreadMethod", value: unset' })
instance Attr everything SpreadMethod  Unit  where
  attr SpreadMethod _ = unsafeAttribute $ This $ pure $
    { key: "spreadMethod", value: unset' }
instance Attr everything SpreadMethod (Event.Event  Unit ) where
  attr SpreadMethod eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "spreadMethod", value: unset' }

instance Attr everything SpreadMethod (ST.ST Global.Global  Unit ) where
  attr SpreadMethod stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "spreadMethod", value: unset' }
