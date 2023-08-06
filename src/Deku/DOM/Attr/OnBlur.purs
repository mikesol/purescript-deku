module Deku.DOM.Attr.OnBlur where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnBlur = OnBlur

instance Attr anything OnBlur (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnBlur bothValues = unsafeAttribute $ Both (pure 
    { key: "blur", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "blur", value: cb' value })
instance Attr anything OnBlur (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnBlur (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "blur", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "blur", value: cb' value })
instance Attr anything OnBlur  Cb  where
  attr OnBlur value = unsafeAttribute $ This $ pure $
    { key: "blur", value: cb' value }
instance Attr anything OnBlur (Event.Event  Cb ) where
  attr OnBlur eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "blur", value: cb' value }

instance Attr anything OnBlur (ST.ST Global.Global  Cb ) where
  attr OnBlur iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "blur", value: cb' value }

instance Attr anything OnBlur (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnBlur bothValues = unsafeAttribute $ Both (pure 
    { key: "blur", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "blur", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnBlur (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnBlur (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "blur", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "blur", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnBlur  (Effect Unit)  where
  attr OnBlur value = unsafeAttribute $ This $ pure $
    { key: "blur", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnBlur (Event.Event  (Effect Unit) ) where
  attr OnBlur eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "blur", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnBlur (ST.ST Global.Global  (Effect Unit) ) where
  attr OnBlur iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "blur", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnBlur (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnBlur bothValues = unsafeAttribute $ Both (pure 
    { key: "blur", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "blur", value: cb' (Cb (const value)) }
    )
instance Attr anything OnBlur (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnBlur (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "blur", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "blur", value: cb' (Cb (const value)) }
    )
instance Attr anything OnBlur  (Effect Boolean)  where
  attr OnBlur value = unsafeAttribute $ This $ pure $
    { key: "blur", value: cb' (Cb (const value)) }
instance Attr anything OnBlur (Event.Event  (Effect Boolean) ) where
  attr OnBlur eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "blur", value: cb' (Cb (const value)) }

instance Attr anything OnBlur (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnBlur iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "blur", value: cb' (Cb (const value)) }

instance Attr everything OnBlur (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnBlur bothValues = unsafeAttribute $ Both (pure  { key: "blur", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "blur", value: unset' })
instance Attr everything OnBlur (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnBlur (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "blur", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "blur", value: unset' })
instance Attr everything OnBlur  Unit  where
  attr OnBlur _ = unsafeAttribute $ This $ { key: "blur", value: unset' }
instance Attr everything OnBlur (Event.Event  Unit ) where
  attr OnBlur eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "blur", value: unset' }

instance Attr everything OnBlur (ST.ST Global.Global  Unit ) where
  attr OnBlur iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "blur", value: unset' }
