module Deku.DOM.Attr.Importance where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Importance = Importance

instance Attr Iframe_ Importance (NonEmpty.NonEmpty Event.Event  String ) where
  attr Importance bothValues = unsafeAttribute $ Both (pure 
    { key: "importance", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "importance", value: prop' value })
instance Attr Iframe_ Importance (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Importance (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "importance", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "importance", value: prop' value })
instance Attr Iframe_ Importance  String  where
  attr Importance value = unsafeAttribute $ This $ pure $
    { key: "importance", value: prop' value }
instance Attr Iframe_ Importance (Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "importance", value: prop' value }

instance Attr Iframe_ Importance (ST.ST Global.Global  String ) where
  attr Importance iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "importance", value: prop' value }

instance Attr Img_ Importance (NonEmpty.NonEmpty Event.Event  String ) where
  attr Importance bothValues = unsafeAttribute $ Both (pure 
    { key: "importance", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "importance", value: prop' value })
instance Attr Img_ Importance (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Importance (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "importance", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "importance", value: prop' value })
instance Attr Img_ Importance  String  where
  attr Importance value = unsafeAttribute $ This $ pure $
    { key: "importance", value: prop' value }
instance Attr Img_ Importance (Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "importance", value: prop' value }

instance Attr Img_ Importance (ST.ST Global.Global  String ) where
  attr Importance iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "importance", value: prop' value }

instance Attr Link_ Importance (NonEmpty.NonEmpty Event.Event  String ) where
  attr Importance bothValues = unsafeAttribute $ Both (pure 
    { key: "importance", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "importance", value: prop' value })
instance Attr Link_ Importance (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Importance (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "importance", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "importance", value: prop' value })
instance Attr Link_ Importance  String  where
  attr Importance value = unsafeAttribute $ This $ pure $
    { key: "importance", value: prop' value }
instance Attr Link_ Importance (Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "importance", value: prop' value }

instance Attr Link_ Importance (ST.ST Global.Global  String ) where
  attr Importance iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "importance", value: prop' value }

instance Attr Script_ Importance (NonEmpty.NonEmpty Event.Event  String ) where
  attr Importance bothValues = unsafeAttribute $ Both (pure 
    { key: "importance", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "importance", value: prop' value })
instance Attr Script_ Importance (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Importance (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "importance", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "importance", value: prop' value })
instance Attr Script_ Importance  String  where
  attr Importance value = unsafeAttribute $ This $ pure $
    { key: "importance", value: prop' value }
instance Attr Script_ Importance (Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "importance", value: prop' value }

instance Attr Script_ Importance (ST.ST Global.Global  String ) where
  attr Importance iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "importance", value: prop' value }

instance Attr everything Importance (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Importance bothValues = unsafeAttribute $ Both (pure 
    { key: "importance", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "importance", value: unset' })
instance Attr everything Importance (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Importance (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "importance", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "importance", value: unset' })
instance Attr everything Importance  Unit  where
  attr Importance _ = unsafeAttribute $ This $ pure $
    { key: "importance", value: unset' }
instance Attr everything Importance (Event.Event  Unit ) where
  attr Importance eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "importance", value: unset' }

instance Attr everything Importance (ST.ST Global.Global  Unit ) where
  attr Importance iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "importance", value: unset' }
