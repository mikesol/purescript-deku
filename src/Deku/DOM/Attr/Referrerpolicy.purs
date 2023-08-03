module Deku.DOM.Attr.Referrerpolicy where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Referrerpolicy = Referrerpolicy

instance Attr A_ Referrerpolicy (NonEmpty.NonEmpty Event.Event  String ) where
  attr Referrerpolicy bothValues = unsafeAttribute $ Both (pure 
    { key: "referrerpolicy", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "referrerpolicy", value: prop' value })
instance Attr A_ Referrerpolicy (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Referrerpolicy (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "referrerpolicy", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "referrerpolicy", value: prop' value })
instance Attr A_ Referrerpolicy  String  where
  attr Referrerpolicy value = unsafeAttribute $ This $ pure $
    { key: "referrerpolicy", value: prop' value }
instance Attr A_ Referrerpolicy (Event.Event  String ) where
  attr Referrerpolicy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "referrerpolicy", value: prop' value }

instance Attr A_ Referrerpolicy (ST.ST Global.Global  String ) where
  attr Referrerpolicy stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "referrerpolicy", value: prop' value }

instance Attr Area_ Referrerpolicy (NonEmpty.NonEmpty Event.Event  String ) where
  attr Referrerpolicy bothValues = unsafeAttribute $ Both (pure 
    { key: "referrerpolicy", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "referrerpolicy", value: prop' value })
instance Attr Area_ Referrerpolicy (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Referrerpolicy (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "referrerpolicy", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "referrerpolicy", value: prop' value })
instance Attr Area_ Referrerpolicy  String  where
  attr Referrerpolicy value = unsafeAttribute $ This $ pure $
    { key: "referrerpolicy", value: prop' value }
instance Attr Area_ Referrerpolicy (Event.Event  String ) where
  attr Referrerpolicy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "referrerpolicy", value: prop' value }

instance Attr Area_ Referrerpolicy (ST.ST Global.Global  String ) where
  attr Referrerpolicy stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "referrerpolicy", value: prop' value }

instance Attr Iframe_ Referrerpolicy (NonEmpty.NonEmpty Event.Event  String ) where
  attr Referrerpolicy bothValues = unsafeAttribute $ Both (pure 
    { key: "referrerpolicy", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "referrerpolicy", value: prop' value })
instance Attr Iframe_ Referrerpolicy (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Referrerpolicy (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "referrerpolicy", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "referrerpolicy", value: prop' value })
instance Attr Iframe_ Referrerpolicy  String  where
  attr Referrerpolicy value = unsafeAttribute $ This $ pure $
    { key: "referrerpolicy", value: prop' value }
instance Attr Iframe_ Referrerpolicy (Event.Event  String ) where
  attr Referrerpolicy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "referrerpolicy", value: prop' value }

instance Attr Iframe_ Referrerpolicy (ST.ST Global.Global  String ) where
  attr Referrerpolicy stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "referrerpolicy", value: prop' value }

instance Attr Img_ Referrerpolicy (NonEmpty.NonEmpty Event.Event  String ) where
  attr Referrerpolicy bothValues = unsafeAttribute $ Both (pure 
    { key: "referrerpolicy", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "referrerpolicy", value: prop' value })
instance Attr Img_ Referrerpolicy (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Referrerpolicy (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "referrerpolicy", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "referrerpolicy", value: prop' value })
instance Attr Img_ Referrerpolicy  String  where
  attr Referrerpolicy value = unsafeAttribute $ This $ pure $
    { key: "referrerpolicy", value: prop' value }
instance Attr Img_ Referrerpolicy (Event.Event  String ) where
  attr Referrerpolicy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "referrerpolicy", value: prop' value }

instance Attr Img_ Referrerpolicy (ST.ST Global.Global  String ) where
  attr Referrerpolicy stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "referrerpolicy", value: prop' value }

instance Attr Link_ Referrerpolicy (NonEmpty.NonEmpty Event.Event  String ) where
  attr Referrerpolicy bothValues = unsafeAttribute $ Both (pure 
    { key: "referrerpolicy", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "referrerpolicy", value: prop' value })
instance Attr Link_ Referrerpolicy (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Referrerpolicy (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "referrerpolicy", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "referrerpolicy", value: prop' value })
instance Attr Link_ Referrerpolicy  String  where
  attr Referrerpolicy value = unsafeAttribute $ This $ pure $
    { key: "referrerpolicy", value: prop' value }
instance Attr Link_ Referrerpolicy (Event.Event  String ) where
  attr Referrerpolicy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "referrerpolicy", value: prop' value }

instance Attr Link_ Referrerpolicy (ST.ST Global.Global  String ) where
  attr Referrerpolicy stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "referrerpolicy", value: prop' value }

instance Attr Script_ Referrerpolicy (NonEmpty.NonEmpty Event.Event  String ) where
  attr Referrerpolicy bothValues = unsafeAttribute $ Both (pure 
    { key: "referrerpolicy", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "referrerpolicy", value: prop' value })
instance Attr Script_ Referrerpolicy (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Referrerpolicy (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "referrerpolicy", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "referrerpolicy", value: prop' value })
instance Attr Script_ Referrerpolicy  String  where
  attr Referrerpolicy value = unsafeAttribute $ This $ pure $
    { key: "referrerpolicy", value: prop' value }
instance Attr Script_ Referrerpolicy (Event.Event  String ) where
  attr Referrerpolicy eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "referrerpolicy", value: prop' value }

instance Attr Script_ Referrerpolicy (ST.ST Global.Global  String ) where
  attr Referrerpolicy stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "referrerpolicy", value: prop' value }

instance Attr everything Referrerpolicy (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Referrerpolicy bothValues = unsafeAttribute $ Both (pure 
    { key: "referrerpolicy", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "referrerpolicy", value: unset' })
instance Attr everything Referrerpolicy (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Referrerpolicy (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "referrerpolicy", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "referrerpolicy", value: unset' })
instance Attr everything Referrerpolicy  Unit  where
  attr Referrerpolicy _ = unsafeAttribute $ This $ pure $
    { key: "referrerpolicy", value: unset' }
instance Attr everything Referrerpolicy (Event.Event  Unit ) where
  attr Referrerpolicy eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "referrerpolicy", value: unset' }

instance Attr everything Referrerpolicy (ST.ST Global.Global  Unit ) where
  attr Referrerpolicy stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "referrerpolicy", value: unset' }
