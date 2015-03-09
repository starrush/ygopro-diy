--笛口雏实-喰-
function c11410060.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON+CATEGORY_DESTROY)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetCountLimit(1,11410060+EFFECT_COUNT_CODE_OATH)
	e1:SetHintTiming(TIMING_ATTACK,0x11e0)
	e1:SetTarget(c11410060.target)
	e1:SetOperation(c11410060.activate)
	c:RegisterEffect(e1)
	--spsummon
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(11410060,0))
	e2:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_O)
	e2:SetCode(EVENT_DESTROY)
	e2:SetProperty(EFFECT_FLAG_DELAY+EFFECT_FLAG_DAMAGE_STEP)
	e2:SetCountLimit(1,11410061)
	e2:SetRange(LOCATION_GRAVE)
	e2:SetCondition(c11410060.spcon)
	e2:SetTarget(c11410060.sptg)
	e2:SetOperation(c11410060.spop)
	c:RegisterEffect(e2)
end
function c11410060.filter(c,e,tp)
	return c:IsSetCard(0x475) and c:GetType()==TYPE_TRAP and Duel.IsPlayerCanSpecialSummonMonster(tp,c:GetCode(),0x475,0x1011,3,0,0,RACE_ZOMBIE,ATTRIBUTE_LIGHT) and not c:IsHasEffect(EFFECT_NECRO_VALLEY)
end
function c11410060.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chkc then return chkc:IsControler(1-tp) and chkc:IsOnField() and chkc:IsDestructable() end
	if chk==0 then return Duel.IsExistingTarget(Card.IsDestructable,tp,0,LOCATION_ONFIELD,1,e:GetHandler()) and Duel.GetLocationCount(tp,LOCATION_MZONE)>0 and Duel.IsExistingMatchingCard(c11410060.filter,tp,LOCATION_GRAVE,0,1,nil,e,tp) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)
	local g=Duel.SelectTarget(tp,Card.IsDestructable,tp,0,LOCATION_ONFIELD,1,1,e:GetHandler())
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,g,1,0,0)
end
function c11410060.activate(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) and Duel.Destroy(tc,REASON_EFFECT)>0 and Duel.GetLocationCount(tp,LOCATION_MZONE)>0 and Duel.IsExistingMatchingCard(c11410060.filter,tp,LOCATION_GRAVE,0,1,nil,e,tp) then
		Duel.BreakEffect()
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
		local g=Duel.SelectMatchingCard(tp,c11410060.filter,tp,LOCATION_GRAVE,0,1,1,nil)
		local sc=g:GetFirst()
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_CHANGE_TYPE)
		e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
		e1:SetValue(0x1011)
		e1:SetReset(RESET_EVENT+0x47c0000)
		sc:RegisterEffect(e1,true)
		local e2=e1:Clone()
		e2:SetCode(EFFECT_CHANGE_RACE)
		e2:SetValue(RACE_ZOMBIE)
		sc:RegisterEffect(e2,true)
		local e3=e1:Clone()
		e3:SetCode(EFFECT_CHANGE_ATTRIBUTE)
		e3:SetValue(ATTRIBUTE_LIGHT)
		sc:RegisterEffect(e3,true)
		local e4=e1:Clone()
		e4:SetCode(EFFECT_CHANGE_LEVEL)
		e4:SetValue(3)
		sc:RegisterEffect(e4,true)
		local e5=e1:Clone()
		e5:SetCode(EFFECT_SET_BASE_ATTACK)
		e5:SetValue(0)
		sc:RegisterEffect(e5,true)
		local e6=e1:Clone()
		e6:SetCode(EFFECT_SET_BASE_DEFENCE)
		e6:SetValue(0)
		sc:RegisterEffect(e6,true)
		Duel.SpecialSummon(sc,0,tp,tp,true,false,POS_FACEUP)
	end
end
function c11410060.spfilter(c,tp)
	return c:IsType(TYPE_SPELL+TYPE_TRAP) and c:IsLocation(LOCATION_ONFIELD)
end
function c11410060.spcon(e,tp,eg,ep,ev,re,r,rp)
	return eg:IsExists(c11410060.spfilter,1,nil,tp)
end
function c11410060.sptg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
		and e:GetHandler():IsLocation(LOCATION_GRAVE)
		and Duel.IsPlayerCanSpecialSummonMonster(tp,11410060,0x475,0x11,3,2000,2000,RACE_ZOMBIE,ATTRIBUTE_WATER) end
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,e:GetHandler(),1,0,0)
end
function c11410060.spop(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetLocationCount(tp,LOCATION_MZONE)<=0 then return end
	local c=e:GetHandler()
	if c:IsRelateToEffect(e)
		and Duel.IsPlayerCanSpecialSummonMonster(tp,11410060,0x475,0x11,3,2000,2000,RACE_ZOMBIE,ATTRIBUTE_WATER) then
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_CHANGE_TYPE)
		e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
		e1:SetValue(TYPE_NORMAL+TYPE_MONSTER)
		e1:SetReset(RESET_EVENT+0x47c0000)
		c:RegisterEffect(e1,true)
		local e2=e1:Clone()
		e2:SetCode(EFFECT_CHANGE_RACE)
		e2:SetValue(RACE_ZOMBIE)
		c:RegisterEffect(e2,true)
		local e3=e1:Clone()
		e3:SetCode(EFFECT_CHANGE_ATTRIBUTE)
		e3:SetValue(ATTRIBUTE_WATER)
		c:RegisterEffect(e3,true)
		local e4=e1:Clone()
		e4:SetCode(EFFECT_CHANGE_LEVEL)
		e4:SetValue(3)
		c:RegisterEffect(e4,true)
		local e5=e1:Clone()
		e5:SetCode(EFFECT_SET_BASE_ATTACK)
		e5:SetValue(2000)
		c:RegisterEffect(e5,true)
		local e6=e1:Clone()
		e6:SetCode(EFFECT_SET_BASE_DEFENCE)
		e6:SetValue(2000)
		c:RegisterEffect(e6,true)
		Duel.SpecialSummon(c,0,tp,tp,true,false,POS_FACEUP)
		local e7=Effect.CreateEffect(c)
		e7:SetType(EFFECT_TYPE_SINGLE)
		e7:SetCode(EFFECT_LEAVE_FIELD_REDIRECT)
		e7:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
		e7:SetReset(RESET_EVENT+0x47e0000)
		e7:SetValue(LOCATION_REMOVED)
		c:RegisterEffect(e7,true)
	end
end